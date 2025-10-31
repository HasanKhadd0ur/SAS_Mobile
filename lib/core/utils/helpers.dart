String shortText(String s, [int limit = 120]) {
  if (s.length <= limit) return s;
  return s.substring(0, limit) + '...';
}