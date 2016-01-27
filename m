Received: from exsmtp01.microchip.com ([198.175.253.37]:36942 "EHLO
        email.microchip.com" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S27011466AbcA0PrEHYpVw (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 27 Jan 2016 16:47:04 +0100
Subject: Re: [PATCH v5 10/14] serial: pic32_uart: Add PIC32 UART driver
References: <1452734299-460-1-git-send-email-joshua.henderson@microchip.com>
 <1452734299-460-11-git-send-email-joshua.henderson@microchip.com>
 <56A7A729.10008@microchip.com> <20160126173322.GA1664@kroah.com>
From: Joshua Henderson <joshua.henderson@microchip.com>
Message-ID: <56A8E858.4090804@microchip.com>
Date: Wed, 27 Jan 2016 08:55:04 -0700
MIME-Version: 1.0
In-Reply-To: <20160126173322.GA1664@kroah.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-Path: <Joshua.Henderson@microchip.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, Jiri Slaby <jslaby@suse.com>, linux-mips@linux-mips.org, ralf@linux-mips.org, Andrei Pistirica <andrei.pistirica@microchip.com>, linux-serial@vger.kernel.org, linux-api@vger.kernel.org
Message-ID: <20160127155504.-7Hf4OTkTYJzHrUFMm8V9m41GHgdd_jWICTotTOI2B4@z>

On 01/26/2016 10:33 AM, Greg Kroah-Hartman wrote:
> On Tue, Jan 26, 2016 at 10:04:41AM -0700, Joshua Henderson wrote:
>> Hi Greg and Jiri,
>>
>> Ping!  Need an ack for this or pull it upstream.
> 
> The merge window _just_ ended, please give us a chance to catch up on
> patches to be reviewed.  There's no reason you need a response for this
> right away, it can't be merged until 4.6-rc1, right?
> 

No problem.  There are a few dangling drivers in this series to complete a bootable platform, including this one, that have been stale for awhile now.  I just want to make sure they are ready.

Thanks,
Josh
