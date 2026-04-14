# hana-dart-mcp

DART(전자공시시스템) MCP 서버 — Claude Code에서 한국 기업의 재무데이터를 조회합니다.

## 기능

- **상장사** 공시/재무제표 조회 (사업보고서 기반)
- **비상장 외감기업** 감사보고서 파싱 (XBRL TE태그 기반)
- **DART Taxonomy** 기반 계정 매핑 (영업이익/영업손실 자동 구분)
- OFS(개별) / CFS(연결) 재무제표 모두 지원

## 사전 준비

[OpenDART](https://opendart.fss.or.kr)에서 API 키를 발급받으세요.

## 설치 방법

### 방법 1: Git Clone (권장)

```bash
git clone https://github.com/hkj0607/hana-dart-mcp.git
cd hana-dart-mcp
uv sync
```

Claude Code `.mcp.json`에 추가:

```json
{
  "mcpServers": {
    "dart-mcp": {
      "command": "uv",
      "args": ["--directory", "/path/to/hana-dart-mcp", "run", "dart.py"],
      "env": {
        "DART_API_KEY": "your-api-key-here"
      }
    }
  }
}
```

### 방법 2: Docker

```bash
docker pull hanchdocker/hana-dart-mcp:latest
```

Claude Code `.mcp.json`에 추가:

```json
{
  "mcpServers": {
    "dart-mcp": {
      "command": "docker",
      "args": ["run", "-i", "--rm", "-e", "DART_API_KEY=your-api-key-here", "hanchdocker/hana-dart-mcp:latest"]
    }
  }
}
```

## MCP 도구 목록

| 도구 | 설명 |
|------|------|
| `search_disclosure` | 상장사 주요 재무정보 검색 |
| `search_detailed_financial_data` | 상장사 재무제표 상세 조회 (XBRL) |
| `search_json_financial_data` | 상장사 재무제표 JSON API 조회 |
| `search_business_information` | 사업 현황 정보 조회 |
| `search_audit_report_financial` | 비상장 외감기업 감사보고서 재무데이터 파싱 |
| `get_current_date` | 현재 날짜 조회 |

## 환경 변수

| 변수 | 필수 | 설명 |
|------|------|------|
| `DART_API_KEY` | O | OpenDART API 키 |

## 기반

- [2geonhyup/dart-mcp](https://github.com/2geonhyup/dart-mcp) 원본 기반
- 비상장사 감사보고서 파싱, DART Taxonomy 매핑 추가
