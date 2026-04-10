#!/bin/bash
# SQL ファイルのバリデーションスクリプト
# PostToolUse フックから呼び出される

set -euo pipefail

# 標準入力から JSON を読み取る
INPUT=$(cat)

# 対象ファイルパスを取得
FILE_PATH=$(echo "$INPUT" | grep -oP '"filePath"\s*:\s*"[^"]*"' | head -1 | grep -oP '(?<=")[^"]*(?="$)' || true)

# .sql ファイル以外はスキップ
if [[ -z "$FILE_PATH" || ! "$FILE_PATH" =~ \.sql$ ]]; then
    echo '{"decision": "continue"}'
    exit 0
fi

# ファイルが存在しない場合はスキップ
if [[ ! -f "$FILE_PATH" ]]; then
    echo '{"decision": "continue"}'
    exit 0
fi

WARNINGS=""

# チェック 1: セミコロン終端
LAST_NON_EMPTY=$(grep -v '^\s*$' "$FILE_PATH" | tail -1 || true)
if [[ -n "$LAST_NON_EMPTY" && ! "$LAST_NON_EMPTY" =~ \;[[:space:]]*$ ]]; then
    WARNINGS="${WARNINGS}\n- セミコロンで終端されていません"
fi

# チェック 2: CREATE 文の IF NOT EXISTS / IF EXISTS チェック
if grep -qiP '^\s*CREATE\s+(TABLE|INDEX|SCHEMA|EXTENSION)\b' "$FILE_PATH"; then
    if grep -iP '^\s*CREATE\s+(TABLE|INDEX|SCHEMA|EXTENSION)\b' "$FILE_PATH" | grep -qviP 'IF\s+NOT\s+EXISTS'; then
        WARNINGS="${WARNINGS}\n- CREATE 文に IF NOT EXISTS が使用されていない箇所があります"
    fi
fi

# チェック 3: DROP 文の IF EXISTS チェック
if grep -qiP '^\s*DROP\s+' "$FILE_PATH"; then
    if grep -iP '^\s*DROP\s+' "$FILE_PATH" | grep -qviP 'IF\s+EXISTS'; then
        WARNINGS="${WARNINGS}\n- DROP 文に IF EXISTS が使用されていない箇所があります"
    fi
fi

# 結果出力
if [[ -n "$WARNINGS" ]]; then
    # 警告をシステムメッセージとして返す
    ESCAPED_WARNINGS=$(echo -e "$WARNINGS" | sed 's/"/\\"/g' | tr '\n' ' ')
    echo "{\"decision\": \"continue\", \"systemMessage\": \"SQL バリデーション警告: ${ESCAPED_WARNINGS}\"}"
else
    echo '{"decision": "continue"}'
fi
