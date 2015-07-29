Received: from mail1.windriver.com ([147.11.146.13]:58829 "EHLO
        mail1.windriver.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011696AbbG2QTWh5D7q (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 29 Jul 2015 18:19:22 +0200
Date: Wed, 29 Jul 2015 12:19:12 -0400
From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: samples/kdbus/kdbus-workers.c and cross compiling MIPS
Message-ID: <20150729161912.GF18685@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
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
To: dh.herrmann@googlemail.com
Cc: gregkh@linuxfoundation.org, daniel@zonque.org, tixxdz@opendz.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Message-ID: <20150729161912.hyNsN8rLQOnVW1n_MXDBSW1sa1F4U73y65TEBiExPxI@z>

Hi David,

Does it make sense to build this sample when cross compiling?

The reason I ask is that it has been breaking the linux-next build of
allmodconfig for a while now, with:

  HOSTCC  samples/kdbus/kdbus-workers
samples/kdbus/kdbus-workers.c: In function ‘prime_new’:
samples/kdbus/kdbus-workers.c:934:18: error: ‘__NR_memfd_create’ undeclared (first use in this function)
  p->fd = syscall(__NR_memfd_create, "prime-area", MFD_CLOEXEC);
                  ^
samples/kdbus/kdbus-workers.c:934:18: note: each undeclared identifier is reported only once for each function it appears in
scripts/Makefile.host:91: recipe for target 'samples/kdbus/kdbus-workers' failed
make[2]: *** [samples/kdbus/kdbus-workers] Error 1

http://kisskb.ellerman.id.au/kisskb/buildresult/12473453/

We recently made some changes to skip other sample/test programs when
cross compiling in mainline 65f6f092a6987 and f59514b6a8c5ca6dd and
6a407a81a9abcf.  Maybe it makes sense to do the same here?

Paul.
