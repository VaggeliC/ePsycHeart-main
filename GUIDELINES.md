# ePsycHeart Development Guidelines

## Project Structure

1. Follow the "Folders by Feature/Module" methodology.

```text
The core concept is to have folders as per the features in the application which ensures that the screens, widgets, controllers, services for that particular feature are all contained within a single folder.
```

Example

```text
  <project root>
  |
  +- lib
     |
     +-- <module group>
         |
         +-- <module name>
             |
             +-- screens (screen level widgets)
             |
             +-- widgets (module specific reusable widgets not being screens)
             |
             +-- models (module specific data models)
             |
             +-- services (module specific service classes i.e. api, file, iot services, etc)
             |
             +-- utilities (module specific utility/helper source files)

     ...

     +-- <...another module>

     ...
```

```text
There should be a core module folder following the same pattern as described above with the purpose of containing common/shared as well as the main menu and connection between the various modules source code.
```

## Source Code

1. File and folder names should follow the Flutter guidelines, lower case for both words separated by underscore (i.e. main_menu.dart).

2. All flutter source code related files are placed within the lib folder on the project root.

3. Each source file and class should indicate its type:

* Screens should have the _screen.dart at the end and the class should also include the Screen at the end (i.e. main menu screen should be a class MainMenuScreen at file main_menu_screen.dart)
* Same for services and models

## UI/UX Design

1. reuse widgets and colors from the core module

## Localization

localization files store within the assets/locales/< language code >.json files

## Git Source Commits

Follow semantic commit guidelines as in: <https://www.conventionalcommits.org/en/v1.0.0/#summary>

The commit contains the following structural elements, to communicate intent to the consumers of your library:

* fix: a commit of the type fix patches a bug in your codebase (this correlates with PATCH inSemantic Versioning).
* feat: a commit of the type feat introduces a new feature to the codebase (this correlateswith MINOR in Semantic Versioning).
* BREAKING CHANGE: a commit that has a footer BREAKING CHANGE:, or appends a ! after the typescope, introduces a breaking API change (correlating with MAJOR in Semantic Versioning). ABREAKING CHANGE can be part of commits of any type.
* types other than fix: and feat: are allowed, for example @commitlint/config-conventional(based on the the Angular convention) recommends build:, chore:, ci:, docs:, style:, refactor:,perf:, test:, and others.
* footers other than BREAKING CHANGE: < description > may be provided and follow a conventionsimilar to git trailer format.

Additional types are not mandated by the Conventional Commits specification, and have no implicit effect in Semantic Versioning (unless they include a BREAKING CHANGE). A scope may be provided to a commit’s type, to provide additional contextual information and is contained within parenthesis, e.g., feat(parser): add ability to parse arrays.
