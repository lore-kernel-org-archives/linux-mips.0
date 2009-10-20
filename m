Received: from smtp2.caviumnetworks.com ([209.113.159.134]:9328 "EHLO
	smtp2.caviumnetworks.com" rhost-flags-OK-OK-OK-OK)
	by ftp.linux-mips.org with ESMTP id S1493362AbZJTWsB (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Wed, 21 Oct 2009 00:48:01 +0200
Message-ID: <4ADE3D3C.1070608@caviumnetworks.com>
Date: Tue, 20 Oct 2009 15:44:12 -0700
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: [PATCH] Make MIPS dynamic clocksource/clockevent clock code
 generic
References: <1255819715-19763-1-git-send-email-linus.walleij@stericsson.com>	 <alpine.LFD.2.00.0910200454300.2863@localhost.localdomain>	 <4ADE3225.5050001@caviumnetworks.com> <63386a3d0910201516r71100657y92e3e6c2fab38db9@mail.gmail.com>
In-Reply-To: <63386a3d0910201516r71100657y92e3e6c2fab38db9@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <David.Daney@caviumnetworks.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Linus Walleij <linus.ml.walleij@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Linus Walleij <linus.walleij@stericsson.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mips@linux-mips.org, Mikael Pettersson <mikpe@it.uu.se>, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20091020224412.5ldNVnNo4xd6w_AM3MhoG083-UoTSfnZyr0EDpA8LoU@z>

Linus Walleij wrote:
> 2009/10/20 David Daney <ddaney@caviumnetworks.com>:
> 
>>> Please do not make that functions inline. They are too large and there
>>> is no benefit of inlining them.
>> If that is the case, then perhaps they should not be defined in a header
>> file.
> 
> Of course not. There are apropriate places to put them, but as stated
> I think the use as it is today warrants having them inlined.
> 

I wasn't trying to imply that they shouldn't be inlined, only that if 
you  choose (as you did) to define them in a header file, that they 
*should* be inline.

David Daney
