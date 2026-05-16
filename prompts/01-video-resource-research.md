# Prompt: Video Resource Research

请围绕以下选题搜集可用于短视频剪辑的 YouTube /公开视频资源。

选题：

```text
<在这里写主题、角度、目标观众、平台、视频时长>
```

输出要求：

1. 先给 5-10 个候选视频资源。
2. 每条资源包含：标题、URL、频道/发布方、发布日期、推荐时间段、推荐用途、可能风险、授权状态。
3. 优先选择官方来源、创作者授权、Creative Commons、公共领域或适合评论/教育引用的小片段。
4. 不确定授权时标记为 `rights_review`，不要假设可以商用。
5. 最后给一个建议的下载优先级列表。

输出格式：

```jsonl
{"source_id":"src-001","topic":"","title":"","url":"","publisher":"","published_at":"","candidate_ranges":[{"start":"","end":"","reason":""}],"intended_use":"","rights_status":"rights_review","risk_note":"","priority":1}
```

