import { defineConfig } from 'vite'
import FullReload from 'vite-plugin-full-reload'
import StimulusHMR from 'vite-plugin-stimulus-hmr'
import RubyPlugin from 'vite-plugin-ruby'

export default defineConfig({
  plugins: [
    FullReload(['config/routes.rb', 'app/views/**/*']),
    StimulusHMR(),
    RubyPlugin(),
  ],
})
