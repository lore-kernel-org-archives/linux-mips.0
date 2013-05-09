Received: from mail-ea0-f172.google.com ([209.85.215.172]:45213 "EHLO
        mail-ea0-f172.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6823763Ab3EIVW7UnntO (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 9 May 2013 23:22:59 +0200
Received: by mail-ea0-f172.google.com with SMTP id r16so1897528ead.31
        for <linux-mips@linux-mips.org>; Thu, 09 May 2013 14:22:53 -0700 (PDT)
From: "Svetoslav Neykov" <svetoslav@neykov.name>
References: <1362176257-2328-1-git-send-email-svetoslav@neykov.name> <1362176257-2328-2-git-send-email-svetoslav@neykov.name> <878v57kh4v.fsf@ashishki-desk.ger.corp.intel.com> <5154508B.6050509@pengutronix.de>
In-Reply-To: <5154508B.6050509@pengutronix.de>
Subject: RE: [PATCH v2 1/2] usb: chipidea: big-endian support
Date: Fri, 10 May 2013 00:22:41 +0300
Message-ID: <013d01ce4cfb$5830ab90$089202b0$@neykov.name>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-language: bg
Return-Path: <svetoslav@neykov.name>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: 'Marc Kleine-Budde' <mkl@pengutronix.de>, 'Alexander Shishkin' <alexander.shishkin@linux.intel.com>
Cc: 'Ralf Baechle' <ralf@linux-mips.org>, 'Greg Kroah-Hartman' <gregkh@linuxfoundation.org>, 'Gabor Juhos' <juhosg@openwrt.org>, 'John Crispin' <blogic@openwrt.org>, 'Alan Stern' <stern@rowland.harvard.edu>, "'Luis R. Rodriguez'" <mcgrof@qca.qualcomm.com>, linux-mips@linux-mips.org, linux-usb@vger.kernel.org
Message-ID: <20130509212241.BAIImTpC2BS-TG7tEDVlQRao2wmVvfGOuQWhMGoapn4@z>

Hi Marc,

Marc Kleine-Budde [mailto:mkl@pengutronix.de] (On Thursday, March 28, 2013
4:16 PM)
>On 03/28/2013 10:28 AM, Alexander Shishkin wrote:
>> Svetoslav Neykov <svetoslav@neykov.name> writes:
>> 
>>> Convert between big-endian and little-endian format when accessing
>>> the usb controller structures which are little-endian by
>>> specification. Fix cases where the little-endian memory layout is
>>> taken for granted. The patch doesn't have any effect on the already
>>> supported little-endian architectures.
>
>Has anyone tested how the cpu_to_le32 and vice versa effects the
>load/store operations? Does the compiler generate full 32 bit accesses
>on mips (and big endian arm) or is a byte-shift-or pattern used?

Better late than never... I have checked your question, the value is loaded
in a register and then swapped, so the read is performed only once.

Regards,
Svetoslav.
