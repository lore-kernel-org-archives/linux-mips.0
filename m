Received: from mail-dm3nam03on0133.outbound.protection.outlook.com ([104.47.41.133]:6608
        "EHLO NAM03-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23993514AbeF1RowrGn6X (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 28 Jun 2018 19:44:52 +0200
Date: Thu, 28 Jun 2018 10:44:39 -0700
From: Paul Burton <paul.burton@mips.com>
Subject: Re: Mark kernel page as read-only
Message-ID: <20180628174439.kij5iagryisovb5q@pburton-laptop>
References: <BN7PR17MB22440CB0C1698E7641812FBFF54F0@BN7PR17MB2244.namprd17.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN7PR17MB22440CB0C1698E7641812FBFF54F0@BN7PR17MB2244.namprd17.prod.outlook.com>
Return-Path: <pburton@wavecomp.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: catalin.vasile@keysight.com
Cc: linux-mips@linux-mips.org

Hi Catalin,

On Thu, Jun 28, 2018 at 10:53:22AM +0000, catalin.vasile@keysight.com wrote:
> I have some pages allocated through __get_free_pages(). Is there a way
> to set such a page's protection to be read-only? I am working with an
> octeon2 mips platform.

__get_free_pages() is going to give you a virtual address in the
unmapped (c)kseg0 segment, which you cannot modify the protection of.

One option might be to switch away from __get_free_pages() towards using
alloc_pages(), followed by vmap() with a read-only prot argument.

Thanks,
    Paul
