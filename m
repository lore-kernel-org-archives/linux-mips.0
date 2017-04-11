Received: from mailapp01.imgtec.com ([195.59.15.196]:56044 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993912AbdDKHAt57Si6 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 11 Apr 2017 09:00:49 +0200
From: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Subject: [PATCH 0/3] mips highmem fixes
Date: Tue, 11 Apr 2017 09:00:33 +0200
Message-ID: <1491894036-5440-1-git-send-email-marcin.nowakowski@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Marcin.Nowakowski@imgtec.com>
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
Cc: linux-mips@linux-mips.org, Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Message-ID: <20170411070033.lhDbviS8MtBDjFwhkUbMZP1H9_YiHxWdXRZGJVFKSXo@z>

There are currently a few incorrect assumptions made about the location
and alignment of fixed memory mappings that lead to random crashes when
using highmem with large (>4k) pages

Marcin Nowakowski (3):
  MIPS: mm: fixed mappings: correct initialisation
  MIPS: highmem: ensure that we don't use more than one page for PTEs
  MIPS: mm: adjust PKMAP location

 arch/mips/include/asm/highmem.h    | 5 +++++
 arch/mips/include/asm/pgtable-32.h | 7 ++++++-
 arch/mips/mm/pgtable-32.c          | 6 +++---
 3 files changed, 14 insertions(+), 4 deletions(-)

-- 
2.7.4
