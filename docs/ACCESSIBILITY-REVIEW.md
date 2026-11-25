# Accessibility Review

**Scope:** Public profile README, repository documentation, tables, links, badges, images and embedded external content.  
**Review status:** Checklist published; a complete manual review has not yet been performed. Do not treat this policy as evidence that all content already conforms.

## Requirements

- Use a logical heading hierarchy; do not select heading levels only for visual size.
- Use descriptive link text that remains meaningful out of context.
- Provide useful alternative text for informative images; use empty alternative text only for decorative images.
- Do not communicate status through color alone; include text labels.
- Keep tables simple, with header rows and clear column meaning. Avoid complex merged cells where possible.
- Ensure animated content does not convey essential information only through motion and provide a meaningful text alternative.
- Avoid flashing content and excessive animation. Where an external animated asset cannot be controlled, provide a nearby text description and consider replacing it.
- Keep text readable, avoid excessive all-caps prose, and use plain language for instructions.
- Ensure links and controls have discernible names and avoid ambiguous repeated link labels.
- Consider keyboard-only navigation and screen-reader reading order for any interactive or embedded content.

## Review procedure

1. Review the rendered README and maintained Markdown pages, not only their source.
2. Check heading order, link purpose, image alternatives, table structure and color-independent status.
3. Navigate the rendered page using keyboard-only controls where interactive content exists.
4. Use at least one screen reader where available; record the browser, operating system and assistive technology used.
5. Check responsive rendering at narrow and enlarged text settings.
6. Record each defect as an issue or pull request, including the affected page/element, impact, reproduction steps and proposed remediation.
7. Re-run the relevant checks after remediation and record the commit SHA.

## Review record

| Date | Scope | Method | Result |
|---|---|---|---|
| 2026-11-25 | Review process definition | Documentation and repository source inspection | Checklist established; manual rendered-page and assistive-technology review remains outstanding |

## Limitations

Automated Markdown linting and link checking can detect some structural defects but cannot establish full accessibility. External images, badges, fonts and animated embeds may change independently of this repository. A complete review requires inspection of the rendered output and assistive-technology testing.

## Maintenance

Repeat this review at least annually, after major README/layout changes, and when a user reports an accessibility issue. Keep the review record current and link remediation PRs.
