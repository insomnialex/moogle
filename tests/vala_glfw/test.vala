using GLib;

using GL;
using GLFW;

public class Test {

    public static int main(string[] args) {

        bool running = true;

        // initialize libGLFW, our library that provides access to our GL context, as well as out input.
        glfwInit();

        if (!glfwOpenWindow(640,480, 0,0,0,0,0,0, Mode.WINDOW))
        {
            stderr.printf("Unable to open window.. Exiting..\n");
            glfwTerminate();
            return 1;
        }

        // "main" loop. Press escape to exit.
        while (running)
        {
            // Clear the screen and swap the buffers, a minimal OpenGL application.
            glClear(GL_COLOR_BUFFER_BIT);
            glBegin(GL_TRIANGLES);
                glVertex3f(0.0f, 1.0f, 0.0f);
                glVertex3f(-1.0f, -1.0f, 0.0f);
                glVertex3f(1.0f, -1.0f, 0.0f);
            glEnd();
            glfwSwapBuffers();

            // check to see if ESC was pressed or the window was closed.
            running = !glfwGetKey(Key.ESC) && (bool)glfwGetWindowParam(WindowParam.OPENED);
        }

        // shutdown GLFW.
        glfwTerminate();

        return 0;
    }
}
