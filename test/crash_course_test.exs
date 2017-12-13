defmodule CrashCourseTest do
  use ExUnit.Case
  doctest CrashCourse

  test "greets the world" do
    assert CrashCourse.hello() == :world
  end
end
