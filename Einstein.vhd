-------------------------------------------------------------------------
-- Richa Patel
-- Department of Electrical and Computer Engineering
-- Iowa State University
-------------------------------------------------------------------------


-- Einstein.vhd
-------------------------------------------------------------------------
-- DESCRIPTION: This file contains an implementation of the Einstein
-- equation using multiplier units.
--
--
-- NOTES:
-- 8/29/2018 by Richa Patel::Design created.
-------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;


entity Einstein is

  port(iCLK             : in std_logic;
       iX 		            : in integer;
       oY 		            : out integer);

end Einstein;

architecture structure of Einstein is
  
  -- Describe the component entities as defined in Adder.vhd 
  -- and Multiplier.vhd (not strictly necessary).
  

  component Multiplier
    port(iCLK           : in std_logic;
         iA             : in integer;
         iB             : in integer;
         oC             : out integer);
  end component;

  -- Arbitrary constants for the A, B, C values. No need to change these.
  constant cA : integer := 9487;
  

  -- Signals to store A*x, B*x
  signal sVALUE_Ax: integer;
  -- Signal to store E*x*x
  signal sVALUE_Exx 	         : integer;
  -- Signal to store B*x+C
 

begin

  
  ---------------------------------------------------------------------------
  -- Level 1: Calculate A*x, 
  ---------------------------------------------------------------------------
  g_Mult1: Multiplier
    port MAP(iCLK             => iCLK,
             iA               => cA,
             iB               => iX,
             oC               => sVALUE_Ax);

 
    
 ---------------------------------------------------------------------------
  -- Level 2: Calculate E*x*x, 
  ---------------------------------------------------------------------------
  g_Mult3: Multiplier
    port MAP(iCLK             => iCLK,
             iA               => sVALUE_Ax,
             iB               => cA,
             oC               => sValue_Exx);


end structure;