Received: from mail-bl2lp0204.outbound.protection.outlook.com ([207.46.163.204]:12156
        "EHLO na01-bl2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S6823114Ab3FRT77CinuU (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 18 Jun 2013 21:59:59 +0200
Message-ID: <51C0BC20.2070501@caviumnetworks.com>
Date: Tue, 18 Jun 2013 12:59:28 -0700
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: [PATCH 0/5] MIPS/tty/8250: Use standard 8250 drivers for OCTEON
References: <1371582775-12141-1-git-send-email-ddaney.cavm@gmail.com> <20130618193618.GA1401@linux-mips.org>
In-Reply-To: <20130618193618.GA1401@linux-mips.org>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <David.Daney@caviumnetworks.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: David Daney <ddaney.cavm@gmail.com>, linux-mips@linux-mips.org, Jamie Iles <jamie@jamieiles.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.cz>, linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, David Daney <david.daney@cavium.com>
Message-ID: <20130618195928.N-6inZxQzqv0LzB5ea4xoPp9xEZ4Z_ymKBOtoq2tmPM@z>

On 06/18/2013 12:36 PM, Ralf Baechle wrote:
> On Tue, Jun 18, 2013 at 12:12:50PM -0700, David Daney wrote:
>
>> From: David Daney <david.daney@cavium.com>
>>
>> Get rid of the custom OCTEON UART probe code and use 8250_dw instead.
>>
>> The first patch just gets rid of Ralf's Kconfig workarounds for the
>> real problem, which is OCTEON's inclomplete serial support.
>>
>> Then we just make minor patches to 8250_dw, and rip out all this
>> OCTEON code.
>>
>> Since the patches are all interdependent, we might want to merge them
>> via a single tree (perhaps Ralf's MIPS tree).
>
> Looks good - I was trying to come up with a kludge good enough for 3.10;
> this may be a bit too large ...
>

At this point I think it is fine if some random configs for OCTEON fail 
to build in v3.10.

I was thinking that this would be for 3.11


David Daney
