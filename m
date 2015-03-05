Received: from mailapp01.imgtec.com ([195.59.15.196]:2302 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012109AbbCEA7hfCCyZ (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 5 Mar 2015 01:59:37 +0100
From: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
Subject: [PATCH 08/15] MIPS: csrc-ioasic: Remove FSF mail address from GPL notice
Date: Wed, 4 Mar 2015 16:58:50 -0800
Message-ID: <1425517137-26463-9-git-send-email-dengcheng.zhu@imgtec.com>
In-Reply-To: <1425517137-26463-1-git-send-email-dengcheng.zhu@imgtec.com>
References: <1425517137-26463-1-git-send-email-dengcheng.zhu@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <DengCheng.Zhu@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org, ralf@linux-mips.org
Cc: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
Message-ID: <20150305005850.exHCXvNluYUmMCgXT6yiBxN7eLlaCNBnkeKoQ1UmpNs@z>

This is to make checkpatch.pl happy for the next patch. It would otherwise
say --

ERROR: Do not include the paragraph about writing to the Free Software
Foundation's mailing address from the sample GPL notice. The FSF has
changed addresses in the past, and may do so again. Linux already includes
a copy of the GPL.

Signed-off-by: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
---
 arch/mips/kernel/csrc-ioasic.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/mips/kernel/csrc-ioasic.c b/arch/mips/kernel/csrc-ioasic.c
index 6cbbf6e..54e394d 100644
--- a/arch/mips/kernel/csrc-ioasic.c
+++ b/arch/mips/kernel/csrc-ioasic.c
@@ -12,10 +12,6 @@
  *  but WITHOUT ANY WARRANTY; without even the implied warranty of
  *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  *  GNU General Public License for more details.
- *
- *  You should have received a copy of the GNU General Public License
- *  along with this program; if not, write to the Free Software
- *  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
  */
 #include <linux/clocksource.h>
 #include <linux/init.h>
-- 
1.8.5.3
