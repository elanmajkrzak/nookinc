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
    **!da**
      Shows your own stored dream address.
    **!da <@mention> <@mention> ...**
      Shows the mentioned users stored dream addresses, if they have stored it.
      Ex. !da @CheeseWeens
    **!daadd <your dream address>**
      Stores your dream address so anybody can come check your island out!
    """
  end
end
