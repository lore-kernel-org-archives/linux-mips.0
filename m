From: "Bryan Althouse" <bryan.althouse@3phoenix.com>
Subject: RE: 
Date: Thu, 5 May 2005 11:08:39 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <20050505145508.GJ17119@linux-mips.org>
Message-ID: <20050505150853Z8224990-1340+6554@linux-mips.org>
Return-Path: <bryan.althouse@3phoenix.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: 'Ralf Baechle' <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Message-ID: <20050505150839.YauVKdyYrv_TEPCE93dB-UnrqEFVqnZOoM0hkpC0CcI@z>

Ralf,

Right, there is no AGP.  At first, I was unable to locate the
yosemite_defconfig, so I was running xconfig without a properly defaulted
.config.  I inadvertently left the AGP support enabled.  Now that I am
starting with yosemite_defcofig as a base-line, I have no problems compiling
the kernel.

Thanks,
Bryan

-----Original Message-----
From: Ralf Baechle [mailto:ralf@linux-mips.org] 
Sent: Thursday, May 05, 2005 10:55 AM
To: Alex Gonzalez
Cc: Bryan Althouse; linux-mips@linux-mips.org; TheNop@gmx.net
Subject: Re:

On Wed, May 04, 2005 at 02:55:49PM +0100, Alex Gonzalez wrote:

> Do you need AGP support? My kernel is configured without it.

I'm not aware of any AGP bridge for MIPS systems.

  Ralf
