---
name: search
description: Research-before-coding workflow. Search for existing tools, libraries, and patterns before writing custom code. Invokes the researcher agent.
origin: ECC
---

# search 

Use this skill when:
- Starting a new feature that likely has existing solutions
- Adding a dependency or integration
- The user asks "add X functionality" and you're about to write code
- Before creating a new utility, helper, or abstraction
- The user asks to find out some info on the website/url or do some research

## Workflow

```
┌─────────────────────────────────────────────┐
│  1. NEED ANALYSIS                           │
│     Define what functionality is needed      │
│     Identify language/framework constraints  │
├─────────────────────────────────────────────┤
│  2. PARALLEL SEARCH (researcher agent)      │
│     ┌──────────┐ ┌──────────┐ ┌──────────┐  │
│     │  npm /   │ │  MCP /   │ │  GitHub / │  │
│     │  PyPI    │ │  Skills  │ │  Web      │  │
│     └──────────┘ └──────────┘ └──────────┘  │
├─────────────────────────────────────────────┤
│  3. EVALUATE                                │
│     Score candidates (functionality, maint, │
│     community, docs, license, deps)         │
├─────────────────────────────────────────────┤
│  4. DECIDE                                  │
│     ┌─────────┐  ┌──────────┐  ┌─────────┐  │
│     │  Adopt  │  │  Extend  │  │  Build   │  │
│     │ as-is   │  │  /Wrap   │  │  Custom  │  │
│     └─────────┘  └──────────┘  └─────────┘  │
├─────────────────────────────────────────────┤
│  5. IMPLEMENT                               │
│     Install package / Configure MCP /       │
│     Write minimal custom code               │
└─────────────────────────────────────────────┘
```

## Tools & Execution

### Lightpanda Browsing
- Use Lightpanda for all web-based research, URL scraping, and documentation lookups.
- Prefer absolute paths when interacting with local research artifacts.
- Execute via `lightpanda <url>` or through the specialized researcher agent.

### Optimization Rules
- ALWAYS use `--strip-mode full` to minimize token usage.
- PREFER `markdown` for reading articles or documentation.
- PREFER `semantic_tree` when the goal is to interact with UI elements.

### Lightpanda Usage
lightpanda fetch --dump markdown https://demo-browser.lightpanda.io/campfire-commerce/

#### Fetch Command
--dump          Dumps document to stdout.
                Argument must be 'html', 'markdown', 'semantic_tree', or 'semantic_tree_text'.
                Defaults to no dump.
 
--strip-mode    Comma separated list of tag groups to remove from dump
                the dump. e.g. --strip-mode js,css
                  - "js" script and link[as=script, rel=preload]
                  - "ui" includes img, picture, video, css and svg
                  - "css" includes style and link[rel=stylesheet]
                  - "full" includes js, ui and css
 
--with-base     Add a <base> tag in dump. Defaults to false.
 
--with-frames   Includes the contents of iframes. Defaults to false.
 
--wait-ms       Wait time in milliseconds.
                Defaults to 5000.
 
--wait-until    Wait until the specified event.
                Supported events: load, domcontentloaded, networkidle, done.
                Defaults to 'done'.
 
--insecure-disable-tls-host-verification
                Disables host verification on all HTTP requests. This is an
                advanced option which should only be set if you understand
                and accept the risk of disabling host verification.
 
--obey-robots
                Fetches and obeys the robots.txt (if available) of the web pages
                we make requests towards.
                Defaults to false.
 
--http-proxy    The HTTP proxy to use for all HTTP requests.
                A username:password can be included for basic authentication.
                Defaults to none.
 
--proxy-bearer-token
                The <token> to send for bearer authentication with the proxy
                Proxy-Authorization: Bearer <token>
 
--http-max-concurrent
                The maximum number of concurrent HTTP requests.
                Defaults to 10.
 
--http-max-host-open
                The maximum number of open connection to a given host:port.
                Defaults to 4.
 
--http-connect-timeout
                The time, in milliseconds, for establishing an HTTP connection
                before timing out. 0 means it never times out.
                Defaults to 0.
 
--http-timeout
                The maximum time, in milliseconds, the transfer is allowed
                to complete. 0 means it never times out.
                Defaults to 10000.
 
--http-max-response-size
                Limits the acceptable response size for any request
                (e.g. XHR, fetch, script loading, ...).
                Defaults to no limit.
 
--log-level     The log level: debug, info, warn, error or fatal.
                Defaults towarn.
 
--log-format    The log format: pretty or logfmt.
                Defaults to logfmt.
 
--log-filter-scopes
                Filter out too verbose logs per scope:
                http, unknown_prop, event, ...
 
--user-agent-suffix
                Suffix to append to the Lightpanda/X.Y User-Agent
 
--web-bot-auth-key-file
                Path to the Ed25519 private key PEM file.
 
--web-bot-auth-keyid
                The JWK thumbprint of your public key.
 
--web-bot-auth-domain
                Your domain e.g. yourdomain.com
