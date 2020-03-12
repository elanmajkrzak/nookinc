defmodule Nookinc.Commands.Util do
  def help() do
    """
    **!fc**
      Shows your own stored friend code.
    **!fc <@mention> <@mention> ...**
      Shows the mentioned users stored friend codes, if they have stored it.
      Ex. !fc @CheeseWeens
    **!fcadd <your friend code>**
      Stores your friend code so other users can look you up.
    """
  end
end
