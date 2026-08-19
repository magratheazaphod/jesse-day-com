# jesse-day.com

This repo is my personal website, served at **jesse-day.com**. It is **public**.

Current state: a single placeholder landing page. `PLAN.md` has the original
build plan and is still the reference for what comes next.

## Stack

Static HTML and CSS. No framework, no build step, no dependencies.

- `index.html` - the page
- `style.css` - the only stylesheet
- `hero.jpg` - background photo

Deployed by Cloudflare Pages, git-connected to this repo: production branch
`main`, no build command, output directory `/`. Pushing to `main` deploys.

Preview locally with `python3 -m http.server 8000`.

A static site generator (Astro or Eleventy) is a later call, once there is more
than one page and a header is being repeated. That is a build-command change on
the existing Pages project, not a migration.

## Content direction

Tagline: **"Building AI Products + Scrabble Grandmaster"**.

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
- The Pages project is permanently either Direct Upload or Git-connected. It is
  git-connected; switching would mean deleting the project and re-attaching the
  custom domain.
