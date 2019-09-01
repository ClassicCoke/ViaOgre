function main()
{

if !${Zone.Name.Equal[LoginScene]}
	{
	IRC ${Me} is camping to Login Screen
	eq2execute /Camp login
	}
}
