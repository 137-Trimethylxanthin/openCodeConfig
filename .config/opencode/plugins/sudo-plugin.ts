import type { Plugin } from "@opencode-ai/plugin"

export const SudoPlugin: Plugin = async ({ client, $, directory }) => {
  await client.app.log({
    body: {
      service: "sudo-plugin",
      level: "info",
      message: "Sudo password plugin initialized. Uses SUDO_PASSWORD or SUDO_ASKPASS.",
    },
  })

  return {
    "shell.env": async (_input, output) => {
      const sudoPwd = Bun.env.SUDO_PASSWORD

      if (sudoPwd) {
        output.env.SUDO_PASSWORD = sudoPwd
        output.env.SUDO_ASKPASS = `${process.env.HOME}/.config/opencode/bin/sudo-askpass`
      }

      const sudoEnabled = Bun.env.OPENCODE_SUDO_ENABLED
      if (sudoEnabled === "1" || sudoEnabled === "true") {
        output.env.SUDO_ASKPASS = `${process.env.HOME}/.config/opencode/bin/sudo-askpass`
      }
    },

    "tool.execute.before": async (input, output) => {
      if (input.tool !== "bash") return

      const cmd = output.args.command
      if (typeof cmd !== "string") return

      const stripped = cmd.replace(/\s+/g, " ").trim()
      const isSudo = stripped.startsWith("sudo ") || stripped.startsWith("sudo\t")
      if (!isSudo) return

      output.args.command = `SUDO_ASKPASS="${process.env.HOME}/.config/opencode/bin/sudo-askpass" ${cmd}`
    },
  }
}
