defmodule CrashCourseAgentTest do
  use ExUnit.Case
  doctest CrashCourseAgent

  use ExUnit.Case

  test 'launches GenServer' do
   {status, _pid} = start_server()
   assert status == :ok
  end

  test 'returns empty Map as a default state of GenServer' do
    start_server()
    assert CrashCourseAgent.get == %{}
  end

  test 'returns updated state after put action' do
    start_server
    CrashCourseAgent.put(:a, 1)
    assert CrashCourseAgent.get() == %{a: 1}
  end

  test 'returns desired key value for get ' do
    start_server()
    set_state()

    assert CrashCourseAgent.get(:a) == 1
  end

  test 'deletes desired key' do
    start_server
    set_state
    assert CrashCourseAgent.get == %{a: 1, b: 3}

    CrashCourseAgent.delete(:b)

    assert CrashCourseAgent.get() == %{a: 1}
  end

  test 'clears state' do
    start_server
    set_state
    assert CrashCourseAgent.get == %{a: 1, b: 3}

    CrashCourseAgent.clear()

    assert CrashCourseAgent.get() == %{}
  end

  def start_server() do
    CrashCourseAgent.start_link()
  end

  def set_state() do
    CrashCourseAgent.put(:a, 1)
    CrashCourseAgent.put(:b, 3)
  end
end
