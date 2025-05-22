{ lib
, fetchFromGitHub
, python3Packages
}:
let
  agno = python3Packages.buildPythonPackage rec {
    pname = "agno";
    version = "1.5.3";
    pyproject = true;

    src = python3Packages.fetchPypi {
      inherit pname version;
      sha256 = "sha256-gkdNV/QLKOuxWZ7u5nhoxetmS5lu80shFVHNkqRJ3a8=";
    };

    build-system = with python3Packages; [
      setuptools
    ];

    dependencies = with python3Packages; [
      docstring-parser
      gitpython
      pydantic-settings
      pydantic
      httpx
      python-dotenv
      python-multipart
      pyyaml
      rich
      tomli
      typer
      typing-extensions
    ];

    meta = {
      description = "a lightweight, high-performance library for building Agents";
      homepage = "https://agno.com";
      license = lib.licenses.mpl20;
    };
  };
in
python3Packages.buildPythonApplication {
  pname = "codemcp";
  version = "0.6.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "ezyang";
    repo = "codemcp";
    rev = "0.6.0";
    hash = "sha256-8gDzGE0oySNItl9NT5RL2hEUXjP5xNdvJFGmxknYXPM=";
  };

  build-system = with python3Packages; [
    hatchling
  ];

  dependencies = with python3Packages; [
    agno
    anthropic
    anyio
    click
    editorconfig
    fastapi
    google-genai
    mcp
    pyyaml
    ruff
    starlette
    toml
    tomli
    uvicorn
    pathspec
  ];

  meta = {
    description = "Coding assistant MCP for Claude Desktop";
    homepage = "https://github.com/ezyang/codemcp";
    mainProgram = "codemcp";
    license = lib.licenses.asl20;
  };
}
