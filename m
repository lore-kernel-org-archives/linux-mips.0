Received: from bby1mta02.pmc-sierra.com ([216.241.235.117]:45628 "EHLO
        bby1mta02.pmc-sierra.bc.ca" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1494137AbZLNOEc convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 14 Dec 2009 15:04:32 +0100
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
        charset="US-ASCII"
Content-Transfer-Encoding: 8BIT
Subject: Help in enabling HIGHMEM support
Date: Mon, 14 Dec 2009 05:34:13 -0800
Message-ID: <A7DEA48C84FD0B48AAAE33F328C020140457EE41@BBY1EXM11.pmc_nt.nt.pmc-sierra.bc.ca>
In-Reply-To: <Pine.LNX.4.64.0912131240100.24267@ask.diku.dk>
References: <Pine.LNX.4.64.0912131240100.24267@ask.diku.dk>
From: "Anoop P.A." <Anoop_P.A@pmc-sierra.com>
Return-Path: <Anoop_P.A@pmc-sierra.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Cc: ralf@linux-mips.org
Message-ID: <20091214133413.m-vEetdkqe9owgwSHITEBaLl21Vt530INODKEmmQ0mU@z>

Hi list,

We have a requirement to use a bigger RAM (1 GB / 2GB) with a RM9000
based SOC. I thought of going with HIGHMEM path rather than enabling
64bit support thinking it will be easier.

I have tried enabling HIGMEM in kernel. Board boots fine with a 512 MB
RAM plugged in. But if I connect a 1 GB RAM kernel will not boot. I am
not even getting single print from kernel. I am using linux-2.6.18
kernel.

It will be great if get any pointers suggestions in debugging this?

Thanks
Anoop 
