# One-Click Bootstrap

This page defines the fastest supported path to install and initialize ZeroClaw.

Last verified: **February 20, 2026**.

## Option 0: Homebrew (macOS/Linuxbrew)

```bash
brew install zeroclaw
```

## Option A (Recommended): Clone + local script

```bash
git clone https://github.com/zeroclaw-labs/zeroclaw.git
cd zeroclaw
./bootstrap.sh
```

What it does by default:

1. `cargo build --release --locked`
2. `cargo install --path . --force --locked`

### Resource preflight and pre-built flow

Source builds typically require at least:

- **2 GB RAM + swap**
- **6 GB free disk**

When resources are constrained, bootstrap now attempts a pre-built binary first.

```bash
./bootstrap.sh --prefer-prebuilt
```

To require binary-only installation and fail if no compatible release asset exists:

```bash
./bootstrap.sh --prebuilt-only
```

To bypass pre-built flow and force source compilation:

```bash
./bootstrap.sh --force-source-build
```

## Dual-mode bootstrap

Default behavior is **app-only** (build/install ZeroClaw) and expects existing Rust toolchain.

For fresh machines, enable environment bootstrap explicitly:

```bash
./bootstrap.sh --install-system-deps --install-rust
```

Notes:

- `--install-system-deps` installs compiler/build prerequisites (may require `sudo`).
- `--install-rust` installs Rust via `rustup` when missing.
- `--prefer-prebuilt` tries release binary download first, then falls back to source build.
- `--prebuilt-only` disables source fallback.
- `--force-source-build` disables pre-built flow entirely.

## Option B: Fast local clone

```bash
git clone https://github.com/zeroclaw-labs/zeroclaw.git
cd zeroclaw
./zeroclaw_install.sh
```

This keeps execution local so you can inspect scripts before running them.

Legacy compatibility:

```bash
./scripts/install.sh
```

`scripts/install.sh` is a compatibility entrypoint and forwards to local `zeroclaw_install.sh` / `scripts/bootstrap.sh`.

Remote clone-and-exec fallback is disabled by default for security. If needed, opt in explicitly with `ZEROCLAW_ALLOW_REMOTE_CLONE=1` and set `ZEROCLAW_BOOTSTRAP_GIT_REF` to an immutable tag/commit.

## Optional onboarding modes

### Containerized onboarding (Docker)

```bash
./bootstrap.sh --docker
```

This builds a local ZeroClaw image and launches onboarding inside a container while
persisting config/workspace to `./.zeroclaw-docker`.

### Quick onboarding (non-interactive)

```bash
./bootstrap.sh --onboard --api-key "sk-..." --provider openrouter
```

Or with environment variables:

```bash
ZEROCLAW_API_KEY="sk-..." ZEROCLAW_PROVIDER="openrouter" ./bootstrap.sh --onboard
```

### Interactive onboarding

```bash
./bootstrap.sh --interactive-onboard
```

## Useful flags

- `--install-system-deps`
- `--install-rust`
- `--skip-build`
- `--skip-install`
- `--provider <id>`

See all options:

```bash
./bootstrap.sh --help
```

## Related docs

- [README.md](../README.md)
- [commands-reference.md](commands-reference.md)
- [providers-reference.md](providers-reference.md)
- [channels-reference.md](channels-reference.md)
