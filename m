Date: Thu, 5 Sep 2002 12:15:40 +0200 (MEST)
From: Kjeld Borch Egevang <kjelde@mips.com>
Subject: Re: 64-bit and N32 kernel interfaces
In-Reply-To: <20020904204038.D1121@linux-mips.org>
Message-ID: <Pine.LNX.4.44.0209051143300.2960-100000@coplin19.mips.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-Path: <kjelde@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Ralf Baechle <ralf@linux-mips.org>
Cc: Jun Sun <jsun@mvista.com>, "Maciej W. Rozycki" <macro@ds2.pg.gda.pl>, linux-mips@linux-mips.org
Message-ID: <20020905101540.RZqHtHKIq8U740Y9iFpx4oE75vc2Gsw5CaNT7mKLzac@z>

On Wed, 4 Sep 2002, Ralf Baechle wrote:

...
> Several approach to solve that problem.  Adding another 1000 entries - which
> will cost 8000 bytes of memory that will be mostly zeros.  Having wrappers
> for each function that do the appropriate argument and result convertion
> is another.  etc.

Ralf, that's not true. In our current 64-bit kernel we have 234 entries 
for N64 which uses 8*234 = 1872 bytes. N32 has 241 entries using 1928 
bytes. Even in an embedded environment that's not a lot of memory.


/Kjeld

-- 
_    _ ____  ___                       Mailto:kjelde@mips.com
|\  /|||___)(___    MIPS Denmark       Direct: +45 44 86 55 85
| \/ |||    ____)   Lautrupvang 4 B    Switch: +45 44 86 55 55
  TECHNOLOGIES      DK-2750 Ballerup   Fax...: +45 44 86 55 56
                    Denmark            http://www.mips.com/
