

# add a new dependency with `uv add <package>`. This will add it to the pyproject.toml file and the uv.lock file



# `uv tool run` is equivalent to `uvx`
# by default `uvx` will run the command with the same name as the package when run like `uvx <package>`.
# when run like `uv tool run . <package>` it should do the same as previous command, but locally.
run-dev:
	uv tool run . sherlock-mcp



