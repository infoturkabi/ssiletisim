# SS İletişim — Website (v1)

A single-page premium-local mobile-shop website for **SS İletişim** in Ümraniye / İstanbul.

Built from `SS_ILETISIM_CLAUDE_WEBSITE_BRIEF.md`. Plain static HTML/CSS/JS — no build step.

## Files

```
05_WEBSITE/
├── index.html       ← the page
├── style.css        ← all styling (dark + gold palette per brief)
├── script.js        ← mobile menu + footer year (tiny)
├── README.md        ← this file
└── assets/
    └── images/      ← put storefront / signboard / interior photos here
```

## How to deploy → **ssiletisim.com** (domain already registered 2026-05-31)

**Recommended: Cloudflare Pages (free hosting, fast CDN, SSL included)**

1. Go to https://dash.cloudflare.com/?to=/:account/pages
2. Click **Create application** → **Pages** → **Upload assets**
3. Project name: `ssiletisim` → drag the entire `05_WEBSITE/` folder into the upload area
4. Click **Deploy site** — you'll get a URL like `ssiletisim.pages.dev` in ~30 seconds
5. Once it works at the .pages.dev URL, add the custom domain:
   - In the Pages project → **Custom domains** → **Set up a custom domain**
   - Enter `ssiletisim.com` (and `www.ssiletisim.com`)
   - Cloudflare will tell you which DNS records to set at your domain registrar
6. At your domain registrar (where you bought ssiletisim.com):
   - Add the CNAME / A records Cloudflare gave you
   - Wait ~5–30 min for DNS to propagate
7. SSL is automatic. Done.

**Future updates:** drag the updated `05_WEBSITE/` folder onto the same Pages project → it redeploys in seconds.

### Alternative options
- **Netlify drag-and-drop**: https://app.netlify.com/drop — same idea as Cloudflare Pages.
- **Hostinger** (~1,500–3,000 TL/yr): upload via File Manager into `public_html`. Use only if you also need email hosting on the domain.
- **Local preview only**: open `index.html` in any browser — works without any hosting.

## How to edit the phone numbers

Phone numbers used on the page:
- **WhatsApp** (mobile): `0545 248 36 36` → encoded as `905452483636` in `wa.me/` links
- **Store call** (landline): `0531 012 53 79`
- **Address**: İstiklal Mah., Mithatpaşa Cd. No:4, 34762 Ümraniye / İstanbul

To change them, open `index.html` and find-replace:

```
905452483636      ← WhatsApp number (no spaces, no +)
+905310125379     ← Call link
0531 012 53 79    ← Displayed store number
0545 248 36 36    ← Displayed WhatsApp number
```

There are also 3 buttons that pre-fill a WhatsApp message — those URLs include `?text=...`. You can change the default message there too.

## How to update the Google Maps embed

In `index.html`, find:
```
<iframe src="https://maps.google.com/maps?q=SS+...&output=embed" ...>
```
Replace the `q=` query with a different place name or paste a full Google Maps **Embed** iframe code (Maps → Share → Embed a map).

## How to replace images

The brief mentions a gallery section. v1 doesn't include a photo gallery (keeps the page fast). To add photos:
1. Drop JPG/PNG files into `assets/images/` (named e.g. `storefront.jpg`, `signboard.jpg`).
2. Open `index.html` and add a gallery section with `<img src="assets/images/storefront.jpg" alt="...">`.
3. Optimise images to ~150 KB each (use https://squoosh.app — free).

## What's NOT in v1 (intentional)

Per brief's "Important Build Notes":
- No e-commerce checkout
- No fake reviews (real ones link to Google)
- No payment integration
- No complex animations
- No photo gallery (add when real photos are dropped in)

## Verify before sharing

Before sending the URL to anyone, please confirm:
- [ ] WhatsApp number `0545 248 36 36` is correct and monitored
- [ ] Store landline `0531 012 53 79` is correct
- [ ] Hours (currently shows Pazartesi–Cumartesi 09:30–21:30) — verify with owner
- [ ] Address `Mithatpaşa Cd. No:4` is the right one
- [ ] Brand list (Apple / Samsung / Xiaomi / Honor / Oppo / Vivo / Realme) matches stock

## SEO targets (already in `<head>`)

```
telefoncu ümraniye
iphone ikinci el ümraniye
telefon tamiri ümraniye
iphone pil değişimi ümraniye
telefon aksesuar ümraniye
ikinci el telefon ümraniye
telefon takas ümraniye
```

For local-SEO impact, also: set up Google Business Profile (already exists — 5.0 / 29 reviews), add this website URL to it, ensure NAP (name, address, phone) matches exactly between the site and the Google listing.

## Owner / context

- **Project:** SS İletişim website v1
- **Brief:** `01_DOCS/SS_ILETISIM_CLAUDE_WEBSITE_BRIEF.md`
- **Relationship to TSARA Group:** Personal favor — NOT a TSARA division (per Şahin, 2026-05-31).
