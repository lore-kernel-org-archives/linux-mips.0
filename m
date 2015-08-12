Received: from mailapp01.imgtec.com ([195.59.15.196]:3020 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010957AbbHLKVGMREvX (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 12 Aug 2015 12:21:06 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id D0896D7D76EB
        for <linux-mips@linux-mips.org>; Wed, 12 Aug 2015 11:20:58 +0100 (IST)
From: Alex Smith <alex.smith@imgtec.com>
Subject: VDSO
Message-ID: <55CB1E0C.4070405@imgtec.com>
Date: Wed, 12 Aug 2015 11:21:00 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-Path: <Alex.Smith@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org
Message-ID: <20150812102100.LzrYGT1S5Xa4WWu9PSM-HFHLzywnbBZhk9R9pqJwo8U@z>

Hi,

I'm intending to start work on a proper VDSO implementation for MIPS that can provide user implementations of gettimeofday() and such, as well as take over from the current signal return trampoline code.

Just wondering if there's anyone else who's doing any work towards this so we can avoid duplication of effort if so?

Thanks,
Alex
