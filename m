Received: from mail-bl2lp0209.outbound.protection.outlook.com ([207.46.163.209]:38934
        "EHLO na01-bl2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S6837168AbaEFPwWTbxdW (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 6 May 2014 17:52:22 +0200
From: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
Subject: [PATCH 00/11] kvm tools: Misc patches (mips support)
Date: Tue, 6 May 2014 17:51:20 +0200
Message-ID: <1399391491-5021-1-git-send-email-andreas.herrmann@caviumnetworks.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Andreas.Herrmann@caviumnetworks.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Pekka Enberg <penberg@kernel.org>
Cc: David Daney <ddaney.cavm@gmail.com>, Andreas Herrmann <andreas.herrmann@caviumnetworks.com>, kvm@vger.kernel.org, linux-mips@linux-mips.org
Message-ID: <20140506155120.B-mFjJ0G_XZ3CNIkbfCh7XqkwXFZo5zU_XARWB1RKNA@z>

Hi,

These patches contain changes that I am currently using on top of
git://github.com/penberg/linux-kvm.git (as of v3.13-rc1-1427-gd9147fb)
to run lkvm on MIPS.

The core is David's work for mips support and laoding elf binaries.

I rebased his stuff, rearranged patches somewhat and split out general
(non-mips-specific) modifications.

I used lkvm to test mips-paravirtualized guest on a host running KVM
with MIPS-VZ (on octeon3). (Patches for this are not upstream yet but
are in the works.)

Comments are welcome.


Thanks,

Andreas
