# jesse-day.com

This repo is my personal website, served at **jesse-day.com**. It is **public**.

Current state: a single placeholder landing page.

`PLAN.md` is the original build plan. It is kept on disk but **gitignored and
not published** - it discusses the domain squatter and the search-disambiguation
problem, which is fine as working notes and needless on a public profile. Its
Cloudflare Pages steps are superseded; see Stack below.

## Stack

Static HTML and CSS. No framework, no build step, no runtime dependencies.

- `public/` - **everything served at the domain.** Site files go here and
  nowhere else; repo docs stay at the root so they are not served.
- `public/index.html`, `public/style.css`, `public/hero.jpg`
- `public/og.jpg` - 1200x630 link-preview card, generated from `hero.jpg`
- `wrangler.jsonc` - Cloudflare Workers config
- `package.json` + `package-lock.json` - pins wrangler; there is no build step

Deployed by **Cloudflare Workers (Static Assets)**, git-connected to this repo.
Pushing to `main` deploys; Cloudflare runs `npx wrangler deploy`, no build
command.

`wrangler.jsonc` has no `main` entry point, making this an assets-only Worker -
Cloudflare serves `public/` and runs no code. Add `main` if it ever needs
server-side logic.

**This is Workers, not Cloudflare Pages.** Pages was the original plan and is
now out of date. Cloudflare's docs tell new projects to
use Workers, and state that all their investment and feature work goes to
Workers while Pages is merely kept working. Do not migrate this back to Pages.

Preview locally with `npm install && npm run dev` (wrangler dev). `python3 -m
http.server` from inside `public/` is the zero-dependency alternative.

A static site generator (Astro or Eleventy) is a later call, once there is more
than one page and a header is being repeated. That is a build-command change on
the existing project, not a migration.

## Content direction

Tagline: **"Building AI products. World Scrabble Grandmaster."**

**Grandmaster is a WESPA title** - the World English-Language Scrabble Players
Association, the international body, which runs a formal titles system. It is
not a NASPA thing; NASPA has no such title. Do not soften or hedge it.

WESPA profile: <https://wespa.xerafin.net/player.html?id=1420> (WESPA ID 1420).
The landing page links to it as **"Scrabble"** - deliberately plain, since
"WESPA Profile" means nothing to a recruiter. The page is JS-rendered, so
fetching it without a browser returns an empty loading state.

Two components at minimum when the real site is built:

1. **AI projects portfolio** - Woogles.io, the ad-spend forecasting platform, the
   LLM job-ingestion work. Write-ups with the problem, the call made, the result.
2. **Scrabble** - the competitive record and the Woogles connection.

Climate (the Berkeley PhD) is a **stub for later**, not a launch item.

Each strand should get its own indexable page rather than one long scroll. The
bare name is not winnable in search - a Canadian commodities media host owns
`jesseday.ca`, and a Meta product design manager holds `linkedin.com/in/jesseday`
and `github.com/jesseday` - so each page needs to carry its own disambiguating
context.

Keep it lightweight. Prefer adding real content over adding machinery.

## Design

Full-bleed background photo behind a short block of text.

- The background is **lightly** graded - roughly `saturate(0.8) brightness(0.85)`,
  plus a scrim for legibility. Do not desaturate hard; the photo should still
  read as a photo. (The heavy 55%/62% grade in the `job-search` tracker is a
  different brief - that background sits behind dense data.)
- Source photos from **Pexels, Unsplash, or Wikimedia Commons**, hand-picked
  through the website rather than an API.
- **Attribution stays in the page footer** for anything under CC BY / CC BY-SA,
  and the credit is recorded in `README.md`. Strip EXIF before committing.

## Publishing discipline

**This repo is public and git history is permanent.** PLAN.md was published
here once and removing it took a history rewrite and a force-push, which still
left the old commit fetchable by SHA until GitHub garbage-collects. Assume
anything committed is public forever.

So: **working artifacts never get committed.** Plans, notes, handoffs, drafts,
context dumps, transcripts, backups, scratch files - anything written while
building the site rather than being part of it. Keep them on disk; they are
gitignored.

Two mechanisms enforce this, and neither is optional:

1. **`public/` is the only thing served.** The Worker has no `main`, so
   Cloudflare serves `public/` and nothing else. Repo docs at the root are
   unreachable from the web by construction, not by convention.
2. **`.githooks/pre-commit` blocks artifacts at commit time.** It rejects
   artifact-shaped filenames anywhere in the tree, and any *new* path at the
   repo root that is not on its allowlist. Enabled by `scripts/setup.sh`
   (`core.hooksPath`), so it survives a fresh clone - run that once after
   cloning.

The override is `ALLOW_ARTIFACTS=1 git commit`. If you reach for it, the file
is about to become permanently public - be sure that is what you want, and add
it to the allowlist rather than overriding repeatedly.

Verify a deploy with `./scripts/check-site.sh`, which checks the redirect,
HSTS, assets, certificate, and that repo docs return 404.

## Guardrails

- **Never mix this repo with `job-search`.** That one is private for good reason:
  resumes, contact details, an application log, an encrypted contacts artifact.
  This one is public by design. No shared files, no symlinks, and nothing copied
  across without reading it first. Reading it for a technique is fine.
- **Nothing personal beyond what would go on a business card.** An email address
  is fine; a phone number and home address are not. Git history is forever.
- **The domain is `jesse-day.com`, with the hyphen.** The unhyphenated
  `jesseday.com` is a squatter's parked lander. Never link to it, and watch for
  tooling that autocorrects to it.
- Site files belong in `public/`. Anything added to the repo root is not served -
  which is deliberate for `CLAUDE.md` and `README.md`, and a bug for anything
  else.
