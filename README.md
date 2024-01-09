# sinatra-dice-roll

[Notes for this project are located here.](https://learn.firstdraft.com/lessons/103)

Tips:
- Use the Sinatra package for deploying a minimal dynamic web page.
- Define paths to populate the web page.
- Implement the forward slash symbol ("/") to embed multiline html code within Ruby code:

```
get("/") do
  "
  <h1>Dice Roll</h1>
	
  <ul>
    <li><a href=\"/dice/2/6\">Roll two 6-sided dice</a></li>
    <li><a href=\"/dice/2/10\">Roll two 10-sided dice</a></li>
    <li><a href=\"/dice/1/20\">Roll one 20-sided die</a></li>
    <li><a href=\"/dice/5/4\">Roll five 4-sided dice</a></li>
  </ul>
  "
end
```
