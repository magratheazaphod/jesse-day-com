# jesse-day.com

Source for [jesse-day.com](https://jesse-day.com) - my personal site.

Right now it is a single placeholder page. No framework and no build step: a
static `index.html` plus one stylesheet, served as-is.

## Layout

| Path | What it is |
|---|---|
| `public/` | **Everything served at the domain.** Nothing outside it is public. |
| `public/index.html` | The page |
| `public/style.css` | The only stylesheet |
| `public/hero.jpg` | Background photo (see credit below) |
| `wrangler.jsonc` | Cloudflare Workers config |
| `PLAN.md` | The build plan this repo was set up from |

Keep site files in `public/`. Repo docs live at the root precisely so they are
not served.

## Deploying

Cloudflare **Workers** (Static Assets), git-connected to this repo. Pushing to
`main` deploys - Cloudflare runs `npx wrangler deploy` with no build command.

This is a Workers project, not Cloudflare Pages. Pages still works but
Cloudflare now directs new projects to Workers, and all their ongoing
investment goes there.

`wrangler.jsonc` has no `main` entry point, which makes it an assets-only
Worker: Cloudflare serves `public/` as a static site and runs no code. Adding
`main` later is how this would grow server-side logic.

The domain is registered at Cloudflare in the same account, so DNS and the
certificate for `jesse-day.com` and `www.jesse-day.com` are handled by the
custom-domain setup on the Worker.

## Working on it locally

```sh
npm install
npm run dev
```

That runs `wrangler dev`, which serves `public/` the way Cloudflare will.

For a quick look with no dependencies, `python3 -m http.server` from inside
`public/` also works.

Deploy by hand with `npm run deploy`, though pushing to `main` is the normal
path.

## Credits

Background photo: Honghe Hani rice terraces, Yunnan, China, by
[Jialiang Gao](https://commons.wikimedia.org/wiki/File:Terrace_field_yunnan_china_denoised.jpg),
licensed [CC BY-SA 3.0](https://creativecommons.org/licenses/by-sa/3.0/).
Attribution is in the page footer; keep it there if the photo stays.
