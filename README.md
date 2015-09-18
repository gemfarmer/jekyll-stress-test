# Jekyll Data Test
This is a stress test of Jekyll, and an experiment in creating a nested
directory structure from permutations of configurable data that lives in the
site's `_data` directory, using [data-directory].

To test it out:

1. Install Jekyll.
1. Run `npm install` to install the Node dependencies.
1. Run `make` to generate the `resource/` directory structure.
1. Either time the site build with:

  ```
  time jekyll build
  ```

  or run the watching server, then see what happens when you run `make`:

  ```
  jekyll serve
  ```
  
Running Jekyll 2.5.3 on my mac, build times average around 38 seconds,
and changes to any of the `_data` trigger a complete rebuild when you're
running the watching server. That's a long time to wait when you're
testing!

[data-directory]: https://www.npmjs.com/package/data-directory
