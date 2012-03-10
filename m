Received: from mail-bk0-f49.google.com ([209.85.214.49]:62571 "EHLO
        mail-bk0-f49.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1903700Ab2CJLEI (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 10 Mar 2012 12:04:08 +0100
Received: by bkcjk13 with SMTP id jk13so2351086bkc.36
        for <linux-mips@linux-mips.org>; Sat, 10 Mar 2012 03:04:01 -0800 (PST)
Message-ID: <4F5B34CE.5040900@mvista.com>
Date: Sat, 10 Mar 2012 15:02:38 +0400
From: Sergei Shtylyov <sshtylyov@mvista.com>
MIME-Version: 1.0
Subject: Re: [PATCH 5/7] USB: r8a66597-hcd: restore big-endian operation.
References: <1331311133-26937-1-git-send-email-thomas@codesourcery.com> <1331311133-26937-5-git-send-email-thomas@codesourcery.com>
In-Reply-To: <1331311133-26937-5-git-send-email-thomas@codesourcery.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: Thomas Schwinge <thomas@codesourcery.com>
Cc: Paul Mundt <lethal@linux-sh.org>, linux-sh@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mips@linux-mips.org
Message-ID: <20120310110238.xY-a3SkOVPK-weRsgUA4e7H4qcegpxbe7WO5m79fICw@z>

Hello.

On 09-03-2012 20:38, Thomas Schwinge wrote:

> On SH, as of 37b7a97884ba64bf7d403351ac2a9476ab4f1bba we have to use the

    Please also specify the summary of thta commit in parens.

> endianess-agnostic I/O accessor functions.

> This driver is also enabled in ARM's viper_defconfig as well as MIPS'
> bcm47xx_defconfig and fuloong2e_defconfig -- I suppose none of these are
> operating in big-endian mode, or this issue should already have been noticed
> before.

> The device is now recognized correctly for both litte-endian and big-endian
> sh7785lcr, but I have not tested this any further, as the board is situated in
> a remote data center.

> Signed-off-by: Thomas Schwinge<thomas@codesourcery.com>
> Cc: Paul Mundt<lethal@linux-sh.org>
> Cc: linux-sh@vger.kernel.org
> Cc: linux-usb@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mips@linux-mips.org

WBR, Sergei
