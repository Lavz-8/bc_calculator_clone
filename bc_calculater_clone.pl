use strict;
use warnings;

#getting user input
my $ui = <>;
my @ci;

#validation check
if ($ui =~ /^[0-9\*\/\+\-\^]+$/ and $ui =~ /[0-9]{1}/)
{
  chomp($ui);
  #converting str to array for easy access and validation
  #splitting delimiter (+,-,/,^,*) opertors
  @ci=split(/([\+\-\*\/\^])/,$ui);
  my $i;
  #identifing the size of the array
  my $len=@ci-1;
  
  #calculation starts...(Applying DMAS rules)

  #1st prioritize : ^
  for ($i=0;$i<=$len;$i++)
  {
    if ($ci[$i] eq "^")
    {
      $ci[$i-1]=$ci[$i-1]**$ci[$i+1];
      splice(@ci,$i,2);
      print "@ci\n";
      $len=@ci-1;
      $i=0;
    }
  }
  
  #2nd prioritize : /
  for ($i=0;$i<=$len;$i++)
  {
    if ($ci[$i] eq "/")
    {
      $ci[$i-1]=$ci[$i-1]/$ci[$i+1];
      splice(@ci,$i,2);
      print "@ci\n";
      $len=@ci-1;
      $i=0;
    }
  }

  #3rd prioritize : *
  for ($i=0;$i<=$len;$i++)
  {
    if ($ci[$i] eq "*")
    {
      $ci[$i-1]=$ci[$i-1]*$ci[$i+1];
      splice(@ci,$i,2);
      print "@ci\n";
      $len=@ci-1;
      $i=0;
    }
  }

  #4th prioritize : +
  for ($i=0;$i<=$len;$i++)
  {
    if ($ci[$i] eq "+")
    {
      $ci[$i-1]=$ci[$i-1]+$ci[$i+1];
      splice(@ci,$i,2);
      print "@ci\n";
      $len=@ci-1;
      $i=0;
    }
  }

  #5th prioritize : -
  for ($i=0;$i<=$len;$i++)
  {
    if ($ci[$i] eq "-")
    {
      $ci[$i-1]=$ci[$i-1]-$ci[$i+1];
      splice(@ci,$i,2);
      print "@ci\n";
      $len=@ci-1;
      $i=0;
    }
  }
  #calculation ends...

}

elsif ($ui !~/[0-9]{0,}[\*]+,[\/]+,[\^]+,[\+]+,[\-]+,[0-9]{0,}/ or $ui !~ /.[\$].+,[\@].+,[\!].+,[\&].+,[\%]+.{0}/)
{
    print "Invalid usage : use single(+,-,/,*,^)\n"
}

#print if there is invalid data like (a-z)...
else
{
  print "Invalid Data\n";
}