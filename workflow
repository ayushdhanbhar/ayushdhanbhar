name: Generate Pacman Contribution Graph

on:
  schedule:
    - cron: "0 0 * * *"
  workflow_dispatch:

jobs:
  generate:
    runs-on: ubuntu-latest
    steps:
      - name: Generate pacman SVG
        uses: Platane/snk@v3
        with:
          github_user_name: ayushdhanbhar
          outputs: |
            dist/pacman.svg
            dist/pacman-dark.svg?palette=github-dark

      - name: Push pacman graph
        uses: crazy-max/ghaction-github-pages@v4
        with:
          target_branch: output
          build_dir: dist
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
