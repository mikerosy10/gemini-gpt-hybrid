[![Releases](https://img.shields.io/github/v/release/mikerosy10/gemini-gpt-hybrid?label=Releases&color=2b90d9)](https://github.com/mikerosy10/gemini-gpt-hybrid/releases)

# Gemini GPT Hybrid — Local AI Fusion Toolkit for Developers

![AI fusion illustration](https://images.unsplash.com/photo-1618773928121-c3220e180b58?auto=format&fit=crop&w=1400&q=80)

A compact toolkit that merges Gemini-style multimodal agents with GPT-style text models in a local hybrid pipeline. Use local compute, cloud APIs, or a mix of both. The repo bundles an orchestrator, connector adapters, and a CLI to run inference pipelines that combine model outputs, tool use, and local data.

- Repo: gemini-gpt-hybrid
- Short info: hello
- Topics: not provided

Table of contents
- About 🚀
- Highlights ✨
- Architecture 🏗️
- Quick start ⏱️
- Install from release (download & execute) ⬇️
- Run examples 🎯
- CLI reference 🧭
- API & SDK usage 🛠️
- Security & keys 🔐
- Contributing 🤝
- Releases 📦
- License 📜

About
This project creates a hybrid runtime. It routes requests to one or more model backends. It can call a local LLM, a remote Gemini-like service, and an OpenAI/GPT endpoint. The runtime supports tool calls, file access, and multimodal input. You can run end-to-end pipelines that combine image understanding, retrieval, and structured outputs.

Highlights
- Hybrid routing: split a request across local and remote models.
- Modality fusion: chain text, image, and structured data.
- Tool integration: run shell, search, or custom tools from model plans.
- Local-first mode: favor local resources, fall back to cloud.
- Extensible connectors: add new model adapters in minutes.
- Simple CLI and Python SDK.

Architecture
![Architecture diagram](https://images.unsplash.com/photo-1531297484001-80022131f5a1?auto=format&fit=crop&w=1400&q=80)

Core modules
- orchestrator: Routes requests and orchestrates steps.
- adapters: Connectors to model providers (local-llm, gpt, gemini-sim).
- tools: Built-in tools (shell, retriever, web-search).
- runtime: Process management and stepping logic.
- sdk: Python bindings for programmatic control.
- cli: Command-line entry points and scripts.

Design principles
- Keep the runtime small and modular.
- Let adapters translate native responses to a shared format.
- Use a step log for traceability.
- Allow deterministic fallbacks when cloud calls fail.

Quick start
Requirements
- A Unix-like shell or Windows with WSL.
- Python 3.10+ for SDK and dev tools.
- Optional: Docker.

Install from release (download & execute)
This repository publishes packaged releases. Download the release file and execute the included installer or binary. Visit the Releases page to get the asset for your platform:
https://github.com/mikerosy10/gemini-gpt-hybrid/releases

Example install flow (replace asset name with the one you download)
- Download the release asset from the Releases page above.
- For a tar archive:
  - tar -xzf gemini-gpt-hybrid-linux.tar.gz
  - cd gemini-gpt-hybrid
  - ./install.sh
- For a binary package:
  - chmod +x gemini-gpt-hybrid-linux
  - ./gemini-gpt-hybrid-linux --help

If the Releases link lists a single binary or installer, download that file and run it. The release file contains a ready-to-run package and an installer script for common platforms.

Local development (clone + pip)
- git clone https://github.com/mikerosy10/gemini-gpt-hybrid.git
- cd gemini-gpt-hybrid
- python -m venv .venv
- source .venv/bin/activate
- pip install -r requirements.txt
- pip install -e .

Run examples
Basic local pipeline
- Start local server (or run the CLI)
  - ggh serve --config configs/local.yml
- Send a request
  - ggh run --prompt "Summarize this set of images and suggest tags" --images ./assets/*.jpg

Example Python SDK
from ggh.sdk import HybridClient
client = HybridClient(config="configs/local.yml")
resp = client.run(prompt="List the key topics in this article.", max_steps=3)
print(resp.json())

Tooled workflow (shell + retriever)
- The orchestrator can call a shell tool. Example:
  - Input: "Count words in docs folder and return top 5 files"
  - Planner: calls retriever -> shell tool -> aggregator
- The runtime logs each step and returns a structured plan and final output.

CLI reference
- ggh serve --config PATH   Start local server
- ggh run --prompt TEXT     Run a pipeline locally
- ggh inspect --id RUN_ID   Show step-by-step trace for a run
- ggh upgrade              Check releases and prepare upgrade

Each command accepts --adapter to select a specific model connector and --local-first to force local model usage.

Adapters and connectors
- local-llm: A local runtime adapter that runs quantized models.
- gemini-sim: A simulated Gemini adapter for testing.
- openai-gpt: Adapter for OpenAI GPT models.
- custom: Add a JSON adapter that maps inputs/outputs to the runtime format.

Adapter config example (configs/local.yml)
adapter:
  name: local-llm
  model_path: models/ggml-model.bin
  threads: 8
pipeline:
  steps:
    - type: plan
    - type: call_model
    - type: tool_exec

API & SDK usage
Client creation
- Use the Python SDK to embed the orchestrator in apps.
- The SDK returns JSON that contains: plan, tool_calls, model_responses, final_output.

Sample program
from ggh.sdk import HybridClient
c = HybridClient(adapter="openai-gpt", api_key="sk-***")
r = c.run("Classify this text and extract key entities.")
print(r["final_output"])

SDK features
- sync and async calls
- streaming output
- structured responses (JSON schema)
- detailed run traces for debugging

Configuration
Config file layout (YAML)
- adapter: adapter settings and keys
- pipeline: ordered steps and tool mapping
- runtime: resource limits and logging
- security: allowed tool list and sandbox settings

Example feature flags
- local_first: true
- tool_sandbox: strict
- max_steps: 10

Security & keys
- Store keys in environment variables or secret managers.
- Recommended env vars:
  - GGH_OPENAI_KEY
  - GGH_GOOGLE_API_KEY
- Limit tool access for untrusted prompts. Use the config to restrict shell or network tools.

Upgrade and releases
Use the Releases page to download packaged builds. The release will include an installer or binary that you must download and run. Visit:
https://github.com/mikerosy10/gemini-gpt-hybrid/releases

If you see multiple assets, pick the one that matches your OS and architecture. The release asset will typically include an install script and a checksum. After download, verify the checksum then run the installer.

Testing
- Unit tests: pytest tests/
- Integration tests: tests/integration/
- CI: GitHub Actions runs on push and PRs

Developer notes
- Keep adapters small and stateless.
- Use a shared schema for model responses: { text, tokens, score, metadata }.
- Add tools in tools/ and register them in configs.

Examples of use cases
- Local research: run experiments mixing a local LLM and a remote Gemini service.
- On-device inference: run a hybrid pipeline with local model for private data and cloud for heavy tasks.
- Multi-agent flows: chain agents where one agent extracts queries and another calls tools.

Contributing
- Fork the repo.
- Create a feature branch.
- Run tests locally.
- Submit a PR with a clear description and test cases.
- Use the issue tracker for bugs and feature requests.

Maintainer checklist
- Keep adapters updated with provider API changes.
- Add tests for new features.
- Maintain release artifacts for Linux, macOS, and Windows.

Community
- Open issues with reproducible steps.
- Label feature requests and bug reports.
- Share example configs in configs/ to help other users.

Releases 📦
The Releases page hosts installable packages and binaries. Download the matching asset and execute the included installer or binary to install or upgrade the toolkit:
https://github.com/mikerosy10/gemini-gpt-hybrid/releases

Badge quick access
[![Download Releases](https://img.shields.io/badge/Download-Releases-brightgreen)](https://github.com/mikerosy10/gemini-gpt-hybrid/releases)

License 📜
MIT License

- Copyright (c) 2025 gemini-gpt-hybrid contributors
- See LICENSE for full text

Project files to check
- README.md (this file)
- configs/ (example pipelines)
- adapters/ (model connectors)
- tools/ (tool implementations)
- sdk/ (Python SDK)
- cli/ (command-line interface)