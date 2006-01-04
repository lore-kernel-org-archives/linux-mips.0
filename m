Received: from nwd2mail3.analog.com ([137.71.25.52]:39598 "EHLO
	nwd2mail3.analog.com") by ftp.linux-mips.org with ESMTP
	id S8133488AbWADMsX (ORCPT <rfc822;linux-mips@linux-mips.org>);
	Wed, 4 Jan 2006 12:48:23 +0000
Message-ID: <200601041250.k04CoGaZ025481@lilac.hdcindia.analog.com>
From: "Sathesh Babu Edara" <satheshbabu.edara@analog.com>
Subject: 
Date: Wed, 4 Jan 2006 18:20:45 +0530
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <1136324722.12175.20.camel@orionlinux.starfleet.com>
Return-Path: <satheshbabu.edara@analog.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips-bounce@linux-mips.org, linux-mips@linux-mips.org
Message-ID: <20060104125045.iP3sFpRU1a5Iss0H90IyMBGd2mwGtBTeiBLQy5tFDVI@z>

 

Hi,
   We have ported linux-2.6.12 kernel onto MIPS processor (LX4189) and the
processor speed is 200Mhz.
By default Linux-2.6.12 kernel comes with HZ value 1000.Will this HZ value
cause an overhead on the 200MHZ CPU.Can someone advise me on whether going
back to HZ vaule of 100 like Linux-2.4 will reduce the overhead on this
CPU.What are the side effects this change can cause?.

Regards,
Sathesh 
