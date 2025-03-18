

# add a new dependency with `uv add <package>`.
# This will add it to the pyproject.toml file and the uv.lock file



# `uv tool run` is equivalent to `uvx`
# by default `uvx` will run the command with the same name as the package when run like `uvx <package>`.
# when run like `uv tool run . <package>` it should do the same as previous command, but locally.
run-dev:
	uv tool run . sherlock-mcp

# When a new version is not found, you can refresh the package with:  uvx --refresh sherlock-mcp@0.1.1
run:
	uvx --refresh sherlock-mcp

# In order to release a new version, you need to:
# 0. Clean previous releases
clean:
	rm -rf dist

# 1. Update the version in the pyproject.toml file
# 2. Sync this new package version into the pyproject.toml with:
sync-version:
	uv sync
# 3. Build the package 
build: clean
	uv build

# 4. Test the release locally using the release wheel. I am not sure why the command `sherlock-mcp` can't be ommited here.
run-release: build
	uv tool run --with dist/sherlock_mcp-0.1.1-py3-none-any.whl sherlock-mcp

# 5. Release the package to PyPI
release: build
	uv publish --token $(PYPI_TOKEN)
