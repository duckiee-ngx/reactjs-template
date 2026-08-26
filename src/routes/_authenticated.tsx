import { ensureSession } from "@src/modules/auth/utils/session";
import { createFileRoute, Outlet, redirect } from "@tanstack/react-router";

export const Route = createFileRoute("/_authenticated")({
  beforeLoad: async () => {
    const isSessionValid = await ensureSession();
    if (!isSessionValid) {
      throw redirect({ to: "/auth/login" });
    }
  },
  component: () => <Outlet />,
});
