Received: from mail.windriver.com ([147.11.1.11]:64931 "EHLO
        mail.windriver.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011358AbbG3NuX5tKxc (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 30 Jul 2015 15:50:23 +0200
Message-ID: <55BA2B91.5070107@windriver.com>
Date: Thu, 30 Jul 2015 09:50:09 -0400
From: Paul Gortmaker <paul.gortmaker@windriver.com>
MIME-Version: 1.0
Subject: Re: samples/kdbus/kdbus-workers.c and cross compiling MIPS
References: <20150729161912.GF18685@windriver.com> <CANq1E4TgWK-8JkUtOYfTOL9Dx=jWeVpA-h881TXSA3BNjp+MPw@mail.gmail.com>
In-Reply-To: <CANq1E4TgWK-8JkUtOYfTOL9Dx=jWeVpA-h881TXSA3BNjp+MPw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-Path: <Paul.Gortmaker@windriver.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: David Herrmann <dh.herrmann@gmail.com>
Cc: David Herrmann <dh.herrmann@googlemail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Daniel Mack <daniel@zonque.org>, Djalal Harouni <tixxdz@opendz.org>, linux-mips@linux-mips.org, linux-kernel <linux-kernel@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
Message-ID: <20150730135009.BmD_yeK-YFcYuGGyYaOsypXjpsZnlrm3IPjd27M3SLo@z>

On 2015-07-29 12:31 PM, David Herrmann wrote:
> Hi
> 
> On Wed, Jul 29, 2015 at 6:19 PM, Paul Gortmaker
> <paul.gortmaker@windriver.com> wrote:
>> Hi David,
>>
>> Does it make sense to build this sample when cross compiling?
>>
>> The reason I ask is that it has been breaking the linux-next build of
>> allmodconfig for a while now, with:
>>
>>   HOSTCC  samples/kdbus/kdbus-workers
>> samples/kdbus/kdbus-workers.c: In function ‘prime_new’:
>> samples/kdbus/kdbus-workers.c:934:18: error: ‘__NR_memfd_create’ undeclared (first use in this function)
>>   p->fd = syscall(__NR_memfd_create, "prime-area", MFD_CLOEXEC);
>>                   ^
>> samples/kdbus/kdbus-workers.c:934:18: note: each undeclared identifier is reported only once for each function it appears in
>> scripts/Makefile.host:91: recipe for target 'samples/kdbus/kdbus-workers' failed
>> make[2]: *** [samples/kdbus/kdbus-workers] Error 1
> 
> mips does have this syscall, so I assume the problem is out-of-date
> kernel headers. You can fix this by running:
> 
>     $ make headers_install

No, let me try and clarify. Please note the emphasis on cross compiling
and automated build coverage, i.e. there is no place for manual steps.

On kernel.org there are x86 host binaries that allow a person to build
a kernel for nearly every arch:

https://www.kernel.org/pub/tools/crosstool/

These exist so developers doing treewide changes can test that their
work does not break s390 or powerpc, or ....

However, in the interest of simplicity, these compilers are created
such that they can build the self contained kernel only.  They do not
have all the headers and libc stuff needed to compile and link an
actual s390 or powerpc userspace -- for that you'd need a full sysroot.

And this is fine for 99.9% of stuff.   And it was fine for the automated
builds of the linux-next tree for the MIPS architecture and the 
allmodconfig target prior to the kdbus inclusion.

And I really don't need a s390 or powerpc sample program, hence why
I suggested we skip it when cross compiling, just like the other
commits I quoted.

The implicit rule with linux-next (and linux in general) is essentially
"You broke it, you get to fix it."   So either skipping this in the
Makefile when cross compiling, or working with Michael and the linux-next
team to have their builders somehow skip it needs to be done by the
kdbus team.

Thanks,
Paul.
--

> 
> This will put the sanitized headers in your local kernel tree
> "./usr/". This is preferred over "/usr" as include path for the kernel
> examples, hence, everything should work fine then.
> 
> The kernel samples/ directory is explicitly used for example programs
> for the kernel. Hence, I think it is quite fine to use new kernel
> features. Same applies to the selftests.
> 
> I'd be fine making kdbus-workers a no-op program if __NR_memfd_create
> is not defined. But I'm not really sure that fixes real problems. I
> mean, new samples and selftests will be added by other subsystems and
> those might as well require new kernel headers.
> 
> Thanks
> David
> 
