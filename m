Received: from mailapp01.imgtec.com ([195.59.15.196]:26510 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27028461AbcEMGTgOMECL (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 13 May 2016 08:19:36 +0200
Date: Fri, 13 May 2016 07:19:21 +0100
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: [PATCH 0/3] MIPS: ELF: Header cleanups
Message-ID: <alpine.DEB.2.00.1605121036270.6794@tp.orcam.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <Maciej.Rozycki@imgtec.com>
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
Cc: linux-mips@linux-mips.org
Message-ID: <20160513061921.HDh1pUYY3aaDi5PQvTspmqz79JlVKthrFgpT5hYC8aA@z>

Hi,

 These are the cleanups I promised as a follow up to commit f4d3d504198d 
("mips: Differentiate between 32 and 64 bit ELF header") and commit 
388e72480cf2 ("crash_dump: Add vmcore_elf32_check_arch") as they were 
discussed earlier this year.  Please apply.

  Maciej
