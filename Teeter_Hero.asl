state("Teeter Hero")
{
	float Timer : "UnityPlayer.dll", 0x019667C0, 0x0, 0x0, 0x28, 0x0, 0x60, 0x20, 0x88;
	byte Stage : "UnityPlayer.dll", 0x019B9520, 0xD0, 0x8, 0x60, 0x10, 0x68, 0x9c;
	byte State : "UnityPlayer.dll", 0x01A21E08, 0x0, 0xBD8, 0x18, 0x20, 0x60, 0x28, 0x80;
}

init {
	vars.igt = 0;
}

startup {

}

update {
	if(current.Timer > 0.1)
	{
		vars.igt = current.Timer;
	}
}

gameTime {
	return TimeSpan.FromSeconds(System.Convert.ToDouble(vars.igt));
}

start {
	if(current.State == 2)
	{
		return true;
	}
}

reset {
	if(current.Timer == 0)
	{
		return true;
	}
}

split {
	if(current.Stage > old.Stage)
	{
		return true;
	}
	if(current.State == 4)
	{
		return true;
	}
}