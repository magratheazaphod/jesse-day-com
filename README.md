# jesse-day.com

Source for [jesse-day.com](https://jesse-day.com) - my personal site.

Right now it is a single placeholder page. No framework, no build step: a static
`index.html` plus one stylesheet, served as-is.

## Layout

| File | What it is |
|---|---|
| `index.html` | The page |
| `style.css` | The only stylesheet |
| `hero.jpg` | Background photo (see credit below) |
| `PLAN.md` | The build plan this repo was set up from |

## Deploying

Cloudflare Pages, git-connected to this repo. Production branch `main`, no build
command, output directory `/`. Pushing to `main` deploys.

The domain is registered at Cloudflare in the same account, so the DNS records
and certificate for `jesse-day.com` and `www.jesse-day.com` are handled by the
Pages custom-domain setup.

## Working on it locally

```sh
python3 -m http.server 8000
```

Then open <http://127.0.0.1:8000>. Opening `index.html` over `file://` works too,
but the local server matches production more closely.

## Credits

Background photo: Honghe Hani rice terraces, Yunnan, China, by
[Jialiang Gao](https://commons.wikimedia.org/wiki/File:Terrace_field_yunnan_china_denoised.jpg),
licensed [CC BY-SA 3.0](https://creativecommons.org/licenses/by-sa/3.0/).
Attribution is in the page footer; keep it there if the photo stays.
