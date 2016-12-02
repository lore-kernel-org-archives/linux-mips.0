Received: from mail-by2nam03on0069.outbound.protection.outlook.com ([104.47.42.69]:9751
        "EHLO NAM03-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23993068AbcLBTGcfbjLj (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Fri, 2 Dec 2016 20:06:32 +0100
Subject: Re: [PATCH] MIPS: Use Makefile.postlink to insert relocations into
 vmlinux
References: <1478772133-32081-1-git-send-email-matt.redfearn@imgtec.com>
From: "Steven J. Hill" <Steven.Hill@cavium.com>
Message-ID: <886bbe44-0ad5-dcaa-f27f-ab502e05b4a0@cavium.com>
Date: Fri, 2 Dec 2016 13:06:17 -0600
MIME-Version: 1.0
In-Reply-To: <1478772133-32081-1-git-send-email-matt.redfearn@imgtec.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-Path: <Steven.Hill@cavium.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Matt Redfearn <matt.redfearn@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20161202190617.ySHPapY0Q7BeH0oG2gAlcIBYirG4QtscXNYAQwGHX6E@z>

On 11/10/2016 04:02 AM, Matt Redfearn wrote:
> When relocatable support for MIPS was merged, there was no support for
> an architecture to add a postlink step for vmlinux. This meant that only
> invoking a target within the boot directory, such as uImage, caused the
> relocations to be inserted into vmlinux. Building just the vmlinux
> target would result in a relocatable kernel with no relocation
> information present.
> 
> Commit fbe6e37dab97 ("kbuild: add arch specific post-link Makefile")
> recified this situation, so MIPS can now define a postlink step to add
> relocation information into vmlinux, and remove the additional steps
> tacked onto boot targets.
> 
> Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>
>
Tested on OCTEON III with relocatable kernel.

Tested-by: Steven J. Hill <steven.hill@cavium.com>
