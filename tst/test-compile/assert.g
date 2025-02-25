runtest := function()
    Print(AssertionLevel(), "\n");
    Assert(1, false, "fail-A");
    Assert(1, false);
    Assert(0, true, "fail-B");
    Assert(0, true);
    SetAssertionLevel(2);
    Print(AssertionLevel(), "\n");
    Assert(3, false, "fail-C");
    Assert(3, false);
    Assert(2, true, "fail-D");
    Assert(2, true);

    # ensure we don't abort after an error
    BreakOnError := false;

    Assert(2, false, "pass!\n");
    Assert(2, false);
    Print("end of function\n");
end;
