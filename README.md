# Cozy

The Cozy theme for [Ghost](http://github.com/tryghost/ghost/). This theme is based on Casper, the default theme for Ghost.

> [!CAUTION]
> This repository has been archived and this theme is not maintained anymore

&nbsp;

![screenshot-desktop](https://raw.githubusercontent.com/cozy/cozy-ghost-theme/master/assets/screenshot-desktop.png)

&nbsp;

# Development

## Requirements

Building this theme requires node 8. You also need [gulp](https://gulpjs.com/docs/en/getting-started/quick-start/) cli installed globally.

Required modules should be installed with

```bash
yarn install
```

## Watch

Cozy styles are compiled using Gulp/PostCSS to polyfill future CSS spec. From the theme's root directory:

```bash
yarn dev
```

Now you can edit `/assets/css/` files, which will be compiled to `/assets/built/` automatically.

## Release

The `zip` Gulp task packages the theme files into `dist/<theme-name>.zip`, which you can then upload to your site.

```bash
yarn zip
```

# PostCSS Features Used

- Autoprefixer - Don't worry about writing browser prefixes of any kind, it's all done automatically with support for the latest 2 major versions of every browser.
- Variables - Simple pure CSS variables
- [Color Function](https://github.com/postcss/postcss-color-function)

# SVG Icons

Casper uses inline SVG icons, included via Handlebars partials. You can find all icons inside `/partials/icons`. To use an icon just include the name of the relevant file, eg. To include the SVG icon in `/partials/icons/rss.hbs` - use `{{> "icons/rss"}}`.

You can add your own SVG icons in the same manner.

# Copyright & License

Casper — Copyright (c) 2013-2018 Ghost Foundation - Released under the [MIT license](LICENSE).
