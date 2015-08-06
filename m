Received: from bh-25.webhostbox.net ([208.91.199.152]:40598 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011315AbbHFJuURw9-U (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 6 Aug 2015 11:50:20 +0200
Date: Thu, 6 Aug 2015 02:50:09 -0700
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 0/7] test_user_copy improvements
Message-ID: <20150806095009.GA8498@roeck-us.net>
References: <1438789735-4643-1-git-send-email-james.hogan@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1438789735-4643-1-git-send-email-james.hogan@imgtec.com>
Return-Path: <linux@roeck-us.net>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: James Hogan <james.hogan@imgtec.com>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, linux-mips@linux-mips.org, Kees Cook <keescook@chromium.org>, Andrew Morton <akpm@linux-foundation.org>
Message-ID: <20150806095009.uH0_LkCSx-0APROWjdrwhoMcHl9ylM8YOZkHGUOwirY@z>

Hi James,

On Wed, Aug 05, 2015 at 04:48:48PM +0100, James Hogan wrote:
> These patches extend the test_user_copy test module to handle lots more
> cases of user accessors which architectures can override separately, and
> in particular those which are important for checking the MIPS Enhanced
> Virtual Addressing (EVA) implementations, which need to handle
> overlapping user and kernel address spaces, with special instructions
> for accessing user address space from kernel mode.
> 
> - Checking that kernel pointers are accepted when user address limit is
>   set to KERNEL_DS, as done by the kernel when it internally invokes
>   system calls with kernel pointers.
> - Checking of the unchecked accessors (which don't call access_ok()).
>   Some of the tests are special cased for EVA at the moment which has
>   stricter hardware guarantees for bad user accesses than other
>   configurations.
> - Checking of other sets of user accessors, including the inatomic user
>   copies, copy_in_user, clear_user, the user string accessors, and the
>   user checksum functions, all of which need special handling in arch
>   code with EVA.
> 
> Tested on MIPS with and without EVA, and on x86_64.
> 
The series causes several build failures with other architectures.
