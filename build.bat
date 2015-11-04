echo. > md\combined.md
for %%i in (*.md) do (
	pandoc --from markdown --to markdown --base-header-level=2 --template=combined-template --no-wrap --id-prefix="%%i" %%i >> md\combined.md
	echo. >> md\combined.md
)
